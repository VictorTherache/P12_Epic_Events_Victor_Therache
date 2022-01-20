from django.contrib import admin
from django import forms
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from django.forms.widgets import HiddenInput

from Utilisateur.models import CustomUser, Client
from .models import Event, Contrat


class EpicEventAdminArea(admin.AdminSite):
    """
    Create a Custom Admin page
    """
    site_header = 'Epic Events Panel'


class EventAdminForm(forms.ModelForm):
    """
    Formulaire de création d'évènement
    """
    def __init__(self, *args, **kwargs):
        super(EventAdminForm, self).__init__(*args, **kwargs)
        if self.current_user.role == 'sales':
            my_clients = Client.objects.filter(
                salesContact=self.current_user.id)
            supports_queryset = CustomUser.objects.filter(role='support')
            if self.fields:
                self.fields['client'].queryset = my_clients
                self.fields['supportContact'].queryset = supports_queryset

        class Meta:
            model = Event
            fields = '__all__'


class EventAdminPermissions(admin.ModelAdmin):
    """
    Permissions de l'Evenement dans la page Admin
    """
    form = EventAdminForm

    def get_form(self, request, *args, **kwargs):
        form = super(EventAdminPermissions, self).get_form(
            request,
            *args,
            **kwargs)
        form.current_user = request.user
        return form

    def has_add_permission(self, request):
        if request.user.role == 'sales' or request.user.role == 'management':
            return True
        else:
            return False

    def has_change_permission(self, request, obj=None):
        if request.user.role == 'sales':
            if obj is not None:
                my_clients = Client.objects.filter(
                    salesContact=request.user.id)
                if obj.client in my_clients:
                    return True
        if request.user.role == 'support':
            my_events = Event.objects.filter(supportContact=request.user.id)
            if obj in my_events:
                return True
        if request.user.role == 'management':
            return True
        return False

    def has_delete_permission(self, request, obj=None):
        if request.user.role == 'sales':
            if obj is not None:
                my_clients = Client.objects.filter(
                    salesContact=request.user.id)
                if obj.client in my_clients:
                    return True
        if request.user.role == 'support':
            my_events = Event.objects.filter(supportContact=request.user.id)
            if obj in my_events:
                return True
        if request.user.role == 'management':
            return True
        return False


class ContratAdminForm(forms.ModelForm):
    """
    Formulaire du contrat dans la page Admin
    """

    def __init__(self, *args, **kwargs):
        super(ContratAdminForm, self).__init__(*args, **kwargs)
        # access object through self.instance...
        if self.current_user.role == 'sales':
            my_clients = Client.objects.filter(
                salesContact=self.current_user.id
                )
            current_user = CustomUser.objects.filter(
                email=self.current_user.email
                )
            if self.fields:
                self.fields['client'].queryset = my_clients
                self.fields['salesContact'].queryset = current_user

    class Meta:
        model = Contrat
        fields = '__all__'


class ContratAdminPermissions(admin.ModelAdmin):
    """
    Permissions du Contrat dans la page Admin
    """

    form = ContratAdminForm

    def get_form(self, request, *args, **kwargs):
        form = super(ContratAdminPermissions, self).get_form(
            request,
            *args,
            **kwargs
            )
        form.current_user = request.user
        return form

    def has_add_permission(self, request):
        if request.user.role == 'sales' or request.user.role == 'management':
            return True
        else:
            return False

    def has_change_permission(self, request, obj=None):
        if request.user.role == 'sales':
            if obj is not None:
                my_clients = Client.objects.filter(
                    salesContact=request.user.id
                    )
                if obj.client in my_clients:
                    return True
        if request.user.role == 'management':
            return True
        return False

    def has_delete_permission(self, request, obj=None):
        if request.user.role == 'sales':
            if obj is not None:
                my_clients = Client.objects.filter(
                    salesContact=request.user.id
                    )
                if obj.client in my_clients:
                    return True
        if request.user.role == 'management':
            return True


class ClientAdminForm(forms.ModelForm):
    """
    Formulaire du client dans la page Admin
    """
    def __init__(self, *args, **kwargs):
        super(ClientAdminForm, self).__init__(*args, **kwargs)
        if (self.current_user.role == 'management' or
           self.current_user.role == 'sales'):
            if self.fields:
                all_clients = CustomUser.objects.filter(role='client')
                all_sales_staff = CustomUser.objects.filter(role='sales')
                self.fields['client'].queryset = all_clients
                self.fields['salesContact'].queryset = all_sales_staff

    class Meta:
        model = Contrat
        fields = '__all__'


class ClientAdminPermissions(admin.ModelAdmin):
    """
    Permissions du Client dans la page Admin
    """
    form = ClientAdminForm

    def get_form(self, request, *args, **kwargs):
        form = super(ClientAdminPermissions, self).get_form(
            request,
            *args,
            **kwargs
            )
        form.current_user = request.user
        return form

    def has_change_permission(self, request, obj=None):
        if request.user.role == 'sales':
            my_clients = Client.objects.filter(salesContact=request.user.id)
            if obj in my_clients:
                return True
        return True if request.user.role == 'management' else False

    def has_add_permission(self, request, obj=None):
        if request.user.role == 'sales':
            return True
        return True if request.user.role == 'management' else False

    def has_delete_permission(self, request, obj=None):
        if request.user.role == 'sales':
            my_clients = Client.objects.filter(salesContact=request.user.id)
            if obj in my_clients:
                return True
        return True if request.user.role == 'management' else False


class CustomUserAdminForm(forms.ModelForm):
    """
    Permissions de l'Evenement dans la page Admin
    """

    password1 = forms.CharField(label='Password', widget=forms.PasswordInput)
    password2 = forms.CharField(
        label='Password confirmation',
        widget=forms.PasswordInput
        )

    class Meta:
        model = CustomUser
        fields = ('email', 'first_name', 'last_name', 'role')

    def clean_password2(self):
        """
        Check that the two password entries match
        """
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords don't match")
        return password2

    def save(self, commit=True):
        """
        Save the provided password in hashed format
        """
        CustomUser = super(CustomUserAdminForm, self).save(commit=False)
        CustomUser.set_password(self.cleaned_data["password1"])
        if commit:
            CustomUser.save()
        return CustomUser


class CustomUserChangeForm(forms.ModelForm):
    """
    Un formulaire pour mettre a jour CustomUsers.
    Inclus tout les fields mais remplace le field mdp avec
    un mdp hashé
    """

    def __init__(self, *args, **kwargs):
        super(CustomUserChangeForm, self).__init__(*args, **kwargs)
        if self.current_user.role == 'sales':
            self.fields['role'].widget.choices = [('client', 'Client')]
            self.fields['groups'].widget.choices = []
            self.fields['groups'].widget.widget.attrs = {'display': 'none'}
            self.fields['is_active'].widget = HiddenInput()
            self.fields['is_staff'].widget = HiddenInput()

    password = ReadOnlyPasswordHashField()

    class Meta:
        model = CustomUser
        fields = ('email',
                  'password',
                  'first_name',
                  'last_name',
                  'role',
                  'is_active',
                  'is_admin')

    def clean_password(self):
        return self.initial["password"]

    def has_add_permission(self, request):
        if request.user.role == 'sales' or request.user.role == 'management':
            return True
        else:
            return False

    def has_change_permission(self, request, obj=None):
        if request.user.role == 'sales':
            return True
        return True if request.user.role == 'management' else False

    def has_delete_permission(self, request, obj=None):
        print(request.user.role)
        if request.user.role == 'support':
            return False


class CustomUserAdmin(BaseUserAdmin):
    """
    Page d'Admin concernant les utilisateurs,
    définit les fields à afficher et trier.
    """
    form = CustomUserChangeForm
    add_form = CustomUserAdminForm

    list_display = ('email', 'first_name', 'last_name', 'is_staff')
    list_filter = ('is_admin',)

    fieldsets = (
        (None, {'fields': ('email',
                           'password',
                           'first_name',
                           'last_name',
                           'is_staff',
                           'role')}),
        ('Permissions', {'fields': ('is_active', 'groups')}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2'),
        }),
    )

    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ()

    def get_form(self, request, *args, **kwargs):
        form = super(CustomUserAdmin, self).get_form(request, *args, **kwargs)
        form.current_user = request.user
        return form

    def has_add_permission(self, request):
        if request.user.role == 'sales' or request.user.role == 'management':
            return True
        else:
            return False

    def has_change_permission(self, request, obj=None):
        if request.user.role == 'sales':
            return True
        return True if request.user.role == 'management' else False

    def has_delete_permission(self, request, obj=None):
        if request.user.role == 'support':
            return False
        if request.user.role == 'sales':
            if obj:
                my_clients = Client.objects.filter(
                    salesContact=request.user.id
                    )
                for client in my_clients:
                    if client.client.id == obj.id:
                        return True


epic_site = EpicEventAdminArea(name='EpicEvent')

epic_site.register(Event, EventAdminPermissions)
epic_site.register(CustomUser, CustomUserAdmin)
epic_site.register(Client, ClientAdminPermissions)
epic_site.register(Contrat, ContratAdminPermissions)

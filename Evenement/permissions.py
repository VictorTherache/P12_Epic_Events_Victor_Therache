from rest_framework import permissions
from .models import Contrat, CustomUser, Client, Event


class HasContratChangePermission(permissions.BasePermission):
    """
    Permissions de l'API pour les modifications du contrat
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour effectuer le changement')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            client = Client.objects.get(id=request.data['client'])
            my_clients = Client.objects.filter(
                salesContact=request.user.id
                )
            if request.data['salesContact'] == request.user.id:
                if client in my_clients:
                    return True


class HasContratCreatePermission(permissions.BasePermission):
    """
    Permissions de l'API pour la création du contrat
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour créer un contrat')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            client = Client.objects.get(id=request.data['client'])
            my_clients = Client.objects.filter(salesContact=request.user.id)
            print(my_clients)
            if request.data['salesContact'] == request.user.id:
                if client in my_clients:
                    return True


class HasContratDeletePermission(permissions.BasePermission):
    """
    Permissions de l'API pour la suppresion du contrat
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour créer un utilisateur')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            contrat_id = request.parser_context['kwargs']['pk']
            contrat = Contrat.objects.get(id=contrat_id)
            my_contrats = Contrat.objects.filter(
                salesContact=request.user.id
                )
            if contrat in my_contrats:
                return True


class HasEventChangePermission(permissions.BasePermission):
    """
    Permissions de l'API pour les modifications de l'évènement
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour effectuer le changement')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            client_user = Client.objects.get(id=request.data['client'])
            my_clients = Client.objects.filter(salesContact=request.user.id)
            if client_user in my_clients:
                return True
        if request.user.role == 'support':
            event_id = request.parser_context['kwargs']['pk']
            event = Event.objects.get(id=event_id)
            my_events = Event.objects.filter(supportContact=request.user.id)
            if event in my_events:
                return True


class HasEventCreatePermission(permissions.BasePermission):
    """
    Permissions de l'API pour la création de l'évènement
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour créer un évènement')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            support_user = CustomUser.objects.get(
                id=request.data['supportContact']
                )
            all_supports = CustomUser.objects.filter(role='support')
            client_user = Client.objects.get(id=request.data['client'])
            contrat = Contrat.objects.get(id=request.data['contrat'])
            my_clients = Client.objects.filter(
                salesContact=request.user.id
                )
            my_contrats = Contrat.objects.filter(
                salesContact=request.user.id
                )
            if client_user in my_clients and contrat in my_contrats:
                if support_user in all_supports:
                    return True


class HasEventDeletePermission(permissions.BasePermission):
    """
    Permissions de l'API pour la suppresion de l'évènement
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour créer un utilisateur')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            try:
                event_id = request.parser_context['kwargs']['pk']
                event = Event.objects.get(id=event_id)
                my_clients = Client.objects.filter(
                    salesContact=request.user.id
                    )
                event_client = Client.objects.get(id=event.client.id)
                if event_client in my_clients:
                    return True
            except Event.DoesNotExist:
                return False
        if request.user.role == 'support':
            event_id = request.parser_context['kwargs']['pk']
            event = Event.objects.get(id=event_id)
            my_events = Event.objects.filter(supportContact=request.user.id)
            if event in my_events:
                return True

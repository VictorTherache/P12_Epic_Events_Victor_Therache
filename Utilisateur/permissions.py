from rest_framework import permissions
from .models import CustomUser, Client


class HasUserChangePermission(permissions.BasePermission):
    """
    Permissions de l'API pour les modifications de l'utilisateur
    """
    message = ("Vous devez avoir les autorisations"
               "nécessaires pour effectuer le changement")

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            if request.data['role']:
                user_id = request.parser_context['kwargs']['pk']
                user = CustomUser.objects.get(id=user_id)
                if user.role == 'client':
                    my_clients = Client.objects.filter(
                        salesContact=request.user.id
                        )
                    for client in my_clients:
                        if client.client_id == int(user_id):
                            return True


class HasUserCreatePermission(permissions.BasePermission):
    """
    Permissions de l'API pour la création de l'utilisateur
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour créer un utilisateur')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            if request.data['role'] == 'client':
                return True


class HasClientChangePermission(permissions.BasePermission):
    """
    Permissions de l'API pour les modifications du client
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour effectuer le changement')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            user_id = request.parser_context['kwargs']['pk']
            client_user = Client.objects.get(id=user_id)
            print('CLIENT', client_user)
            my_clients = Client.objects.filter(salesContact=request.user.id)
            print(my_clients)
            for client in my_clients:
                if client == client_user:
                    return True


class HasClientCreatePermission(permissions.BasePermission):
    """
    Permissions de l'API pour la création du client
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour créer un utilisateur')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            if request.data['salesContact'] == request.user.id:
                my_clients = CustomUser.objects.filter(
                    author_user_id=request.user.id
                    )
                if my_clients:
                    user_client = CustomUser.objects.get(
                        id=int(request.data['client'])
                        )
                    if user_client in my_clients:
                        return True


class HasClientDeletePermission(permissions.BasePermission):
    """
    Permissions de l'API pour la suppresion du client
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour créer un utilisateur')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            try:
                client_id = request.parser_context['kwargs']['pk']
                if Client.objects.get(id=client_id):
                    client_user = Client.objects.get(id=client_id)
                    my_clients = Client.objects.filter(
                        salesContact=request.user.id
                        )
                    if client_user in my_clients:
                        return True
            except Client.DoesNotExist:
                return False


class HasUserDeletePermission(permissions.BasePermission):
    """
    Permissions de l'API pour la suppresion de l'utilisateur
    """
    message = ('Vous devez avoir les autorisations'
               'nécessaires pour créer un utilisateur')

    def has_permission(self, request, view):
        if request.user.role == 'management':
            return True
        if request.user.role == 'sales':
            try:
                user_id = request.parser_context['kwargs']['pk']
                my_clients = Client.objects.filter(
                    salesContact=request.user.id
                    )
                for client in my_clients:
                    if client.id == user_id:
                        return True
            except Client.DoesNotExist:
                return False
        if request.user.role == 'support':
            return False

from rest_framework import viewsets
from rest_framework import generics
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.generics import RetrieveAPIView
from rest_framework import generics
from rest_framework.response import Response
from rest_framework import status

from .serializers import UserSerializer, ClientSerializer
from .models import CustomUser, Client
from .permissions import *

class UserViewSet(viewsets.ModelViewSet):
    """
    Vue Django de l'utilisateur, définis les permissions, 
    envois un message lors d'une supression et filtre le queryset
    """
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer
    
    def get_permissions(self):
        """
        Définis les permissions suivant le verbe d'action
        """
        if self.action != None:
            if self.action == 'create':
                permission_classes = [IsAuthenticated, HasUserCreatePermission]
            if self.action == 'list':
                permission_classes = [IsAuthenticated]
            if self.action == 'retrieve':
                permission_classes = [IsAuthenticated]
            if self.action == 'partial_update':
                permission_classes = [IsAuthenticated, HasUserChangePermission]
            if self.action == 'destroy':
                permission_classes = [IsAuthenticated, HasUserDeletePermission]            
            return [permission() for permission in permission_classes]


    def destroy(self, request, *args, **kwargs):
        """
        Permet d'afficher un message lors d'une requete DELETE
        """        
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response({
            "message":"L'utilisateur à bien était supprimé !"
        },
        status=status.HTTP_200_OK)


    def perform_create(self, serializer):
        """
        Action to perform before displaying the object
        """

        serializer.save(author_user_id = self.request.user.id)  


    def get_queryset(self):
        """
        Filtre le queryset suivant le role indiqué dans le endpoint
        """
        queryset = CustomUser.objects.all()
        filtered_role = self.request.query_params.get('role')
        print(filtered_role)
        if filtered_role is not None:
            queryset = CustomUser.objects.filter(role=filtered_role)
        return queryset


class RegisterView(generics.CreateAPIView):
    """
    Vue Django de l'authentification
    """
    queryset = CustomUser.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = UserSerializer


class ClientViewSet(viewsets.ModelViewSet):
    """
    Vue Django du client, définis les permissions, 
    envois un message lors d'une supression.
    """
    queryset = Client.objects.all()
    serializer_class = ClientSerializer

    def get_permissions(self):
        """
        Définis les permissions suivant le verbe d'action
        """
        if self.action == 'create':
            permission_classes = [IsAuthenticated, HasClientCreatePermission]
        if self.action == 'list':
            permission_classes = [IsAuthenticated]
        if self.action == 'retrieve':
            permission_classes = [IsAuthenticated]
        if self.action == 'partial_update':
            permission_classes = [IsAuthenticated, HasClientChangePermission]
        if self.action == 'destroy':
            permission_classes = [IsAuthenticated, HasClientDeletePermission]            
        return [permission() for permission in permission_classes]

    def destroy(self, request, *args, **kwargs):
        """
        Permet d'afficher un message lors d'une requete DELETE
        """        
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response({
            "message":"Le client à bien était supprimé !"
        },
        status=status.HTTP_200_OK)
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status

from .models import Event, Contrat
from .serializers import EventSerializer, ContratSerializer
from .permissions import (
                          HasContratCreatePermission,
                          HasContratChangePermission,
                          HasContratDeletePermission,
                          HasEventCreatePermission,
                          HasEventChangePermission,
                          HasEventDeletePermission
                        )


class ContratViewSet(viewsets.ModelViewSet):
    """
    Vue Django du contrat, définis les permissions,
    envois un message lors d'une supression et filtre le queryset
    """
    queryset = Contrat.objects.all()
    serializer_class = ContratSerializer

    def get_permissions(self):
        """
        Définis les permissions suivant le verbe d'action
        """
        if self.action == 'create':
            permission_classes = [IsAuthenticated, HasContratCreatePermission]
        if self.action == 'list':
            permission_classes = [IsAuthenticated]
        if self.action == 'retrieve':
            permission_classes = [IsAuthenticated]
        if self.action == 'partial_update':
            permission_classes = [IsAuthenticated, HasContratChangePermission]
        if self.action == 'destroy':
            permission_classes = [IsAuthenticated, HasContratDeletePermission]
        return [permission() for permission in permission_classes]

    def destroy(self, request, *args, **kwargs):
        """
        Permet d'afficher un message lors d'une requete DELETE
        """
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response({
            "message": "Le contrat à bien était supprimé !"
        },
            status=status.HTTP_200_OK)

    def get_queryset(self):
        """
        Filtre le queryset suivant le prénom indiqué dans le endpoint
        """
        queryset = Contrat.objects.all()
        first_name = self.request.query_params.get('client')
        list_of_queries = []
        if first_name is not None:
            all_contrats = Contrat.objects.all()
            for contrat in all_contrats:
                print(contrat.client.client.first_name)
                if contrat.client.client.first_name == first_name:
                    list_of_queries.append(contrat)
            return list_of_queries
        return queryset


class EventViewSet(viewsets.ModelViewSet):
    """
    Vue Django de l'évènement, définis les permissions,
    envois un message lors d'une supression et filtre le queryset
    """
    queryset = Event.objects.all()
    serializer_class = EventSerializer

    def get_permissions(self):
        """
        Définis les permissions suivant le verbe d'action
        """
        if self.action == 'create':
            permission_classes = [IsAuthenticated, HasEventCreatePermission]
        if self.action == 'list':
            permission_classes = [IsAuthenticated]
        if self.action == 'retrieve':
            permission_classes = [IsAuthenticated]
        if self.action == 'partial_update':
            permission_classes = [IsAuthenticated, HasEventChangePermission]
        if self.action == 'destroy':
            permission_classes = [IsAuthenticated, HasEventDeletePermission]
        return [permission() for permission in permission_classes]

    def destroy(self, request, *args, **kwargs):
        """
        Permet d'afficher un message lors d'une requete DELETE
        """
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response({
            "message": "L'évènement à bien était supprimé !"
        },
            status=status.HTTP_200_OK)

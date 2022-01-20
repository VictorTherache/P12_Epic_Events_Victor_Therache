from rest_framework import serializers

from .models import Event, Contrat


class EventSerializer(serializers.ModelSerializer):
    """
    Serializer de l'évènement pour afficher les données dans l'api
    """

    dateCreated = serializers.DateTimeField(allow_null=True)
    dateUpdated = serializers.DateTimeField(allow_null=True)
    eventDate = serializers.DateTimeField(allow_null=True)
    notes = serializers.CharField(allow_null=True, allow_blank=True)

    class Meta:
        model = Event
        fields = ('id',
                  'name',
                  'client',
                  'contrat',
                  'dateCreated',
                  'dateUpdated',
                  'supportContact',
                  'attendees',
                  'eventDate',
                  'notes')


class ContratSerializer(serializers.ModelSerializer):
    """
    Serializer du contrat pour afficher les données dans l'api
    """

    dateCreated = serializers.DateTimeField(allow_null=True)
    dateUpdated = serializers.DateTimeField(allow_null=True)
    paymentDue = serializers.DateTimeField(allow_null=True)

    class Meta:
        model = Contrat
        fields = ('id',
                  'client',
                  'dateCreated',
                  'dateUpdated',
                  'salesContact',
                  'status',
                  'amount',
                  'paymentDue')

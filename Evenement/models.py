from django.db import models
import datetime
from Utilisateur.models import CustomUser, Client


class Contrat(models.Model):
    """
    Contract Model based on the ERM Diagram
    """
    salesContact = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    client = models.ForeignKey(Client, on_delete=models.CASCADE)
    dateCreated = models.DateTimeField(auto_now_add=True)
    dateUpdated = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField()
    amount = models.FloatField()
    paymentDue = models.DateTimeField()

    def __str__(self):
        return (f"Contrat de {self.client.client.first_name} "
                f"{self.client.client.last_name}")

    def save(self, *args, **kwargs):
        self.dateUpdated = datetime.datetime.now()
        return super().save(*args, **kwargs)


class Event(models.Model):
    """
    Event Model based on the ERM Diagram
    """
    name = models.CharField(max_length=200, default='Evenement')
    contrat = models.ForeignKey(Contrat, on_delete=models.CASCADE)
    client = models.ForeignKey(Client, on_delete=models.CASCADE)
    dateCreated = models.DateTimeField(auto_now_add=True)
    dateUpdated = models.DateTimeField(auto_now_add=True)
    supportContact = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    attendees = models.CharField(max_length=200)
    eventDate = models.DateTimeField()
    notes = models.CharField(max_length=500, blank=True)

    def __str__(self):
        return f"{self.name}"

    def save(self, *args, **kwargs):
        self.dateUpdated = datetime.datetime.now()
        return super().save(*args, **kwargs)

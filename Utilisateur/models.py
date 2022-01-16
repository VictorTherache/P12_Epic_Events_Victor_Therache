from enum import unique
from typing import AbstractSet
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.contrib.auth.hashers import make_password
from django.contrib.auth import get_user_model
import datetime

# Create your models here.

ROLE = [
    ('sales', 'Sales'),
    ('support', 'Support'),
    ('management', 'Management'),
    ('client', 'Client')
]

CLIENTSTATUS = [
    ('potential', 'Potential'),
    ('confirmed', 'Confirmed'),
]

class CustomUserManager(BaseUserManager):
    """
        Creates and saves a User with the given email, date of
        birth and password.
    """    
    def create_user(self, email, first_name, last_name, role, password=None):
        if not email:
            raise ValueError("User must have an email")
        if not password:
            raise ValueError("User must have a password")
        if not first_name:
            raise ValueError("User must have a first name")
        if not last_name:
            raise ValueError("User must have a last name")

        user = self.model(
            email=self.normalize_email(email)
        )
        user.first_name = first_name
        user.last_name = last_name
        user.role = role
        user.set_password(password)  # change password to hash
        user.is_admin = False
        user.is_staff = True
        user.save(using=self._db)
        return user

    def create_superuser(self, first_name, last_name, role, email, password=None):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """        
        user = self.create_user(
            email = email,
            password=password,
            first_name = first_name,
            last_name= last_name,
            role = role
        )
        user.is_admin = True
        user.is_active = True
        user.is_staff = True
        user.is_superuser = True        
        user.save(using=self._db)
        return user


class CustomUser(AbstractBaseUser, PermissionsMixin):
    """
    Custom User Model
    """
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField(max_length=25, unique=True)
    role = models.CharField(max_length=15, choices=ROLE, blank=True)
    author_user_id = models.IntegerField(null=True) 
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    username = None
    
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS =  ['first_name', 'last_name', 'role']
    
    objects = CustomUserManager()

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

    def save(self, *args, **kwargs):
        self.is_staff = True
        return super().save(*args, **kwargs)

    @staticmethod
    def has_perm(perm, obj=None):
        # "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    @staticmethod
    def has_module_perms(app_label):
        # "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True     

class Client(models.Model):
    clientStatus = models.CharField(max_length=25, choices=CLIENTSTATUS, default='potential')
    client = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    phone = models.CharField(max_length=200, unique=True)
    mobile = models.CharField(max_length=200, unique=True)
    companyName = models.CharField(max_length=200)
    dateCreated = models.DateTimeField(auto_now_add=True)
    dateUpdated = models.DateTimeField(auto_now_add=True)
    salesContact = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='sales_contact')

    def __str__(self):
        return f"{self.client.first_name} {self.client.last_name}"

    def save(self, *args, **kwargs):
        self.dateUpdated = datetime.datetime.now()
        return super().save(*args, **kwargs)
from rest_framework import serializers
from django.contrib.auth import get_user_model
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password

from .models import CustomUser, Client


class UserSerializer(serializers.ModelSerializer):
    """
    Serializer de l'utilisateur pour afficher les données dans l'api
    """
    email = serializers.EmailField(
            required=True,
            validators=[UniqueValidator(queryset=CustomUser.objects.all())]
            )
    password = serializers.CharField(write_only=True, required=True, validators=[validate_password])
    password2 = serializers.CharField(write_only=True, required=True)
    class Meta:
        model = get_user_model()
        fields = ('id', 'first_name', 'last_name', 'password', 'password2', 'email', 'role', 'author_user_id')
        extra_kwargs = {
            'password': {'write_only': True},
        }


    def validate(self, attrs):
        """
        Méthode pour valider les données
        """        
        method = self.context['request']
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Password fields didn't match."})
        return attrs


    def create(self, validated_data):
        """
        Méthode pour créer l'utilisateur, valide les données
        """
        user = CustomUser.objects.create(
            email=validated_data['email'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'], 
            role=validated_data['role'],
            author_user_id = validated_data['author_user_id']
            )
        user.set_password(validated_data['password'])
        user.save()

        return user


    def update(self, instance, validated_data):
        """
        Méthode pour mettre à jour l'utilisateur
        """
        password = validated_data.pop('password', None)

        for (key, value) in validated_data.items():
            setattr(instance, key, value)

        if password is not None:
            instance.set_password(password)

        instance.save()

        return instance


class ClientSerializer(serializers.ModelSerializer):
    """
    Serializer du client pour afficher les données dans l'api
    """

    dateCreated = serializers.DateTimeField(allow_null=True)
    dateUpdated = serializers.DateTimeField(allow_null=True)
    class Meta:
        model = Client
        fields = ('id', 
                  'client', 
                  'clientStatus',
                  'phone', 
                  'mobile',
                  'companyName', 
                  'dateCreated', 
                  'dateUpdated', 
                  'salesContact')



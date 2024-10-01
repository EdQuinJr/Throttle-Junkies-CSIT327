from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.db import models

class UserManager(BaseUserManager):
    def create_user(self, email, first_name, password=None, **extra_fields):
        if not email:
            raise ValueError("The Email field must be set")
        email = self.normalize_email(email)
        user = self.model(email=email, first_name=first_name, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, first_name, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        return self.create_user(email, first_name, password, **extra_fields)

class User(AbstractBaseUser):
    user_id = models.AutoField(primary_key=True)
    email = models.EmailField(max_length=100, unique=True)
    first_name = models.CharField(max_length=50)
    surname = models.CharField(max_length=50, null=True, blank=True)
    phone = models.CharField(max_length=15, null=True, blank=True)
    role = models.CharField(max_length=15,
    choices=[('customer', 'Customer'), ('administrator', 'Administrator')])

    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name']

    class Meta:
        db_table = 'Users'

    def __str__(self):
        return self.email
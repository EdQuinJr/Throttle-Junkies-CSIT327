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
    
class Products(models.Model):
    product_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100, null=True, blank=True)
    product_type = models.CharField(
        max_length=50,
        choices=[('motorcycle', 'Motorcycle'), ('part', 'Part')],
        default='motorcycle',
        null=False
    )
    brand = models.CharField(max_length=100, null=True, blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    year = models.IntegerField(null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    stock_quantity = models.IntegerField(default=0)

    class Meta:
        db_table = 'Products'

    def __str__(self):
        return self.name if self.name else "Unnamed Product"


class Cart(models.Model):
    cart_id = models.AutoField(primary_key=True)  # Matches AUTO_INCREMENT
    user = models.ForeignKey('User', on_delete=models.CASCADE)  # Matches user_id in Users table
    product = models.ForeignKey('Products', on_delete=models.CASCADE)  # Matches product_id in Products table
    quantity = models.IntegerField()  # Matches int(11), cannot be null
    price = models.DecimalField(max_digits=10, decimal_places=2)  # Matches decimal(10,2), cannot be null

    class Meta:
        db_table = 'Cart'  # Ensures this model maps to the existing Cart table

    def __str__(self):
        return f"Cart {self.cart_id} - User {self.user.first_name} {self.user.surname}"
    
class Orders(models.Model):
    order_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('User', on_delete=models.SET_NULL, null=True, db_column='user_id')
    order_date = models.DateTimeField(auto_now_add=True, db_column='order_date')
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, null=True, db_column='total_amount')

    class Meta:
        db_table = 'Orders'

    def __str__(self):
        return f"Order {self.order_id} by User {self.user.username if self.user else 'Unknown'}"  
      
class Payments(models.Model):
    payment_id = models.AutoField(primary_key=True)
    order = models.ForeignKey('Orders', on_delete=models.SET_NULL, null=True, db_column='order_id')
    payment_date = models.DateTimeField(auto_now_add=True, db_column='payment_date')
    amount = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    status = models.CharField(
        max_length=20,
        choices=[
            ('pending', 'Pending'),
            ('completed', 'Completed'),
            ('failed', 'Failed'),
            ('refunded', 'Refunded')
        ],
        default='completed',
        null=False
    )

    class Meta:
        db_table = 'Payments'

    def __str__(self):
        return f"Payment {self.payment_id} for Order {self.order.order_id if self.order else 'Unknown'}"
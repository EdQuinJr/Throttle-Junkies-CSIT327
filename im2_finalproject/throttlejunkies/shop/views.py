from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .models import User,Products,Cart,Orders,Payments
from django.contrib.auth.decorators import login_required
from django.db.models import Sum, F
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
import json

def home(request):
    products = Products.objects.all()
    return render(request, 'index.html',{'products': products})

def login_view(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = authenticate(request, username=email, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, 'Successfully logged in!')
            return redirect('dashboard')  # Correctly redirect to dashboard
        else:
            messages.error(request, 'Invalid login credentials. Please try again.')

    # Avoid rendering login form again after successful login
    if request.user.is_authenticated:
        return redirect('dashboard')

    return render(request, 'index.html')  # Render home page for GET requests

def signup_view(request):
    if request.method == 'POST':
        first_name = request.POST.get('first-name')
        surname = request.POST.get('surname')
        email = request.POST.get('signup-email')
        password = request.POST.get('signup-password')
        role = request.POST.get('role')

        # Check if user already exists
        if User.objects.filter(email=email).exists():
            messages.error(request, 'Email already taken. Please try a different one.')
            return redirect('home')

        # Create new user
        user = User.objects.create_user(email=email, first_name=first_name, password=password, role=role)
        user.surname = surname
        user.save()

        messages.success(request, 'Account created successfully. Please log in.')
        return redirect('home')

    return render(request, 'index.html')

def dashboard_view(request):
    products = Products.objects.all()  # Ensure that products have valid ids
    return render(request, 'dashboard.html', {'products': products})

def shopproduct(request):
    products = Products.objects.all()
    # You can pass any context to the template if needed
    return render(request, 'shopproduct.html',{'products': products})

def logout_view(request):
    logout(request)
    messages.success(request, 'Successfully logged out.')
    return redirect('home')

def about_view(request):
    return render(request, 'about.html')

def Xsr_view(request):
    return render(request, 'Xsr.html')

def Yzfr1_view(request):
    return render(request, 'Yzfr1.html')

def search(request):
    query = request.GET.get('q', '')  # Get search keywords
    category = request.GET.get('category', '')  # Get category filter
    brand = request.GET.get('brand', '')  # Get brand filter

    # Fetch all products initially
    products = Products.objects.all()

    # Apply filters based on input
    if query:
        products = products.filter(name__icontains=query)
    if category:
        products = products.filter(product_type=category)
    if brand:
        products = products.filter(brand__icontains=brand)

    # Return the search results
    return render(request, 'search_results.html', {'products': products, 'query': query})

@login_required
def cart_view(request):
    user_cart = Cart.objects.filter(user=request.user)
    total_price = user_cart.aggregate(total=Sum(F('quantity') * F('price')))['total'] or 0

    # Add a total_price attribute to each cart item
    for item in user_cart:
        item.total_price = item.quantity * item.price

    return render(request, 'cart.html', {'cart': user_cart, 'total_price': total_price})

# View to add an item to the cart
@login_required
def add_to_cart(request, product_id):
    # Ensure the product exists
    try:
        product = Products.objects.get(product_id=product_id)
    except Products.DoesNotExist:
        messages.error(request, "Product not found.")
        return redirect('home')  # Redirect to home if product doesn't exist
    
    # Get quantity from the form submission (default to 1)
    quantity = int(request.POST.get('quantity', 1))
    
    # Check if the product is already in the cart
    cart_item, created = Cart.objects.get_or_create(
        user=request.user,
        product=product,
        defaults={'quantity': quantity, 'price': product.price}
    )

    if not created:
        # If the product is already in the cart, update the quantity
        cart_item.quantity = F('quantity') + quantity
        cart_item.save()

    messages.success(request, f'{product.name} has been added to your cart.')
    return redirect('cart_view')  # Redirect to the cart view

# View to update the quantity of a cart item
@login_required
def update_cart(request, cart_id):
    cart_item = Cart.objects.get(cart_id=cart_id, user=request.user)
    quantity = int(request.POST.get('quantity'))
    
    if quantity <= 0:
        messages.error(request, 'Quantity must be greater than zero.')
    else:
        cart_item.quantity = quantity
        cart_item.save()
        messages.success(request, 'Cart updated successfully.')

    return redirect('cart_view')
# View to remove an item from the cart
@login_required
def remove_from_cart(request, cart_id):
    try:
        # Get the cart item for the current user
        cart_item = Cart.objects.get(cart_id=cart_id, user=request.user)
        cart_item.delete()
        messages.success(request, 'Item has been removed from your cart.')
    except Cart.DoesNotExist:
        messages.error(request, 'The item was not found in your cart.')
    products = Products.objects.all()
    return render(request, 'index.html',{'products': products})

# View to place an order
@login_required
def place_order(request):
    # Get all cart items for the current user
    cart_items = Cart.objects.filter(user=request.user)
    
    # Check if the cart is empty
    if not cart_items:
        messages.error(request, 'Your cart is empty.')
        return redirect('cart_view')

    # Calculate total amount for the order
    total_amount = sum(item.quantity * item.price for item in cart_items)

    # Create the order
    order = Orders.objects.create(user=request.user, total_amount=total_amount)

    # Optionally create order details for each product in the cart
    # OrderItem.objects.bulk_create([
    #     OrderItem(order=order, product=item.product, quantity=item.quantity, price=item.price)
    #     for item in cart_items
    # ])

    # Clear the cart after placing the order
    cart_items.delete()

    # Notify user and redirect to order confirmation
    messages.success(request, f'Order placed successfully! Total: ${total_amount:.2f}')
    return redirect('order_confirmation', order_id=order.order_id)

# View to display the order confirmation
@login_required
def order_confirmation(request, order_id):
    try:
        # Get the order for the current user
        order = Orders.objects.get(order_id=order_id, user=request.user)
        return render(request, 'order_confirmation.html', {'order': order})
    except Orders.DoesNotExist:
        messages.error(request, 'Order not found.')
        return redirect('cart_view')
@csrf_exempt
def proceed_payment(request):
    if request.method == "POST":
        try:
            data = json.loads(request.body)
            order_id = data.get('order_id')
            amount = data.get('amount')
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON.'}, status=400)

        if not order_id or not amount:
            return JsonResponse({'error': 'Missing order ID or amount.'}, status=400)

        try:
            order = Orders.objects.get(order_id=order_id)
        except Orders.DoesNotExist:
            return JsonResponse({'error': 'Order not found.'}, status=404)

        payment = Payments.objects.create(order=order, amount=amount, status='completed')
        return JsonResponse({'success': 'Payment recorded successfully.', 'payment_id': payment.payment_id})

    return JsonResponse({'error': 'Invalid request method.'}, status=405)
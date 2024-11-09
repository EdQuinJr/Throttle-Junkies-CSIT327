from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .models import User

def home(request):
    return render(request, 'index.html')

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
    #if not request.user.is_authenticated:
    #    messages.error(request, 'You must be logged in to access the dashboard.')
    #    return redirect('login')

    return render(request, 'dashboard.html')

def logout_view(request):
    logout(request)
    messages.success(request, 'Successfully logged out.')
    return redirect('home')

def about_view(request):
    return render(request, 'about.html')
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages

def home(request):
    return render(request, 'index.html')

def login_view(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        
        user = authenticate(request, username=email, password=password)
        
        if user is not None:
            login(request, user)
            messages.success(request, 'Successfully logged in!')  # Success message
            return redirect('home')  # Redirect to home or another page
        else:
            messages.error(request, 'Invalid login credentials. Please try again.')
    
    return render(request, 'index.html')

def logout_view(request):
    logout(request)
    messages.success(request, 'Successfully logged out.')
    return redirect('home')
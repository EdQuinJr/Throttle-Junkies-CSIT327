"""
URL configuration for throttlejunkies project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# throttlejunkies/urls.py
from django.urls import path
from shop.views import home, login_view, logout_view, dashboard_view, about_view  # Import from shop.views

urlpatterns = [
    path('', home, name='home'),
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('products/', home, name='products'),
    path('about/', about_view, name='about'),
    path('contact/', home, name='contact'),
    path('dashboard/', dashboard_view, name='dashboard'),
]
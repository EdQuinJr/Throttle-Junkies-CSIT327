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
from shop.views import home,xsr_view,nmax_view,yzf_r1_view, login_view, logout_view, dashboard_view, about_view ,signup_view,search,cart_view,add_to_cart,update_cart,remove_from_cart,place_order,order_confirmation,proceed_payment,shopproduct

urlpatterns = [
    path('', home, name='home'),
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('signup/', signup_view, name='signup'),
    path('products/', home, name='products'),
    path('shopproduct/', shopproduct, name='shopproduct'),
    path('search/', search, name='search'),

    path('about/', about_view, name='about'),
    path('contact/', home, name='contact'),
    path('dashboard/', dashboard_view, name='dashboard'),
    path('cart/', cart_view, name='cart_view'), 
    path('xsr/', xsr_view, name='xsr'),
    path('nmax/', nmax_view, name='nmax'),
    path('yzf-r1/', yzf_r1_view, name='yzf-r1'),
    path('add_to_cart/<int:product_id>/', add_to_cart, name='add_to_cart'),
    path('update_cart/<int:cart_id>/', update_cart, name='update_cart'),
    path('proceed-payment/', proceed_payment, name='proceed_payment'),
    path('remove_from_cart/<int:cart_id>/', remove_from_cart, name='remove_from_cart'),
    path('place_order/', place_order, name='place_order'),
    path('order_confirmation/<int:order_id>/', order_confirmation, name='order_confirmation'),
]
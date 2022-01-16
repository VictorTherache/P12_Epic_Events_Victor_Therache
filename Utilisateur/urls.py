from rest_framework_nested import routers
from django.urls import include, path
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from . import views

router = routers.SimpleRouter()
router.register(r'users', views.UserViewSet)
router.register(r'clients', views.ClientViewSet)


urlpatterns = [
    path('', include(router.urls)),
    path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('signup/', views.RegisterView.as_view(), name='auth_register'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),    
]
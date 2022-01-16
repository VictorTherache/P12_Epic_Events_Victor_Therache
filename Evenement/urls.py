from django.urls import include, path
from rest_framework_nested import routers

from . import views
from Evenement.admin import sales_site

router = routers.SimpleRouter()
router.register(r'contrats', views.ContratViewSet, basename='contrats')
router.register(r'events', views.EventViewSet, basename='events')

urlpatterns = [
    path('', include(router.urls)),
    path('epiceventadmin/', sales_site.urls),
]
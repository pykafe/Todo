from django.views.generic.base import TemplateView
from rest_framework import viewsets
from serializers import TodoSerializer
from models import Todo


# Create your views here.
class TodoView(TemplateView):
    template_name = 'index.html'


class TodoViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer

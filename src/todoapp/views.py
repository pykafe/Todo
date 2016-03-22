from django.views.generic.base import TemplateView


# Create your views here.
class TodoView(TemplateView):
    template_name = 'index.html'

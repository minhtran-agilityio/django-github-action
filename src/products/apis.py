from django.http import JsonResponse
from django.core import serializers

from products.models import Product


def product_list(request):
    """
    List all products
    """
    products = Product.objects.all()
    products_json = serializers.serialize('json', products)
    return JsonResponse(products_json, safe=False)

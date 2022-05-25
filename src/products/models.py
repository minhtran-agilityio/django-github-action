from django.db import models

# Create your models here.
from django.db import models
from django.db.models import QuerySet, Manager
from django.core.cache import cache
from django.utils import timezone


class ProductQuerySet(QuerySet):
    """
    Custom Product Queryset
    """
    def update(self, **kwargs):
        cache.delete('product_objects')
        super(ProductQuerySet, self).update(updated=timezone.now(), **kwargs)


class ProductManager(Manager):
    """
    Custom Product Manager
    """
    def get_queryset(self):
        return ProductQuerySet(self.model, using=self._db)


class Product(models.Model):
    """
    Product Model
    """
    title = models.CharField(max_length=200, blank=False)
    price = models.CharField(max_length=20, blank=False)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    objects = ProductManager()

    class Meta:
        ordering = ['-created']

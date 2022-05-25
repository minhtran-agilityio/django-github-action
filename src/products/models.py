from django.db import models

class Product(models.Model):
    """
    Product Model
    """
    title = models.CharField(max_length=200, blank=False)
    price = models.CharField(max_length=20, blank=False)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        """
        Meta information for Product
        """
        ordering = ['-created']

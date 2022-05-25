from django.contrib import admin
from products.models import Product


class ProductAdmin(admin.ModelAdmin):
    search_fields = ('title',)
    list_display = ('id', 'title', 'price', 'created', 'updated',)
    ordering = ('id',)


admin.site.register(Product, ProductAdmin)

from django.test import TestCase

from products.models import Product


class ProductTestCase(TestCase):
    """
    Product Test Cases
    """
    def setUp(self):
        Product.objects.create(title="product 1", price="$10")
        Product.objects.create(title="product 2", price="$20")

    def tearDown(self):
        Product.objects.all().delete()

    def test_list_products(self):
        """
        Check total objects count
        """
        product_count = Product.objects.all().count()
        self.assertEqual(product_count, 2)

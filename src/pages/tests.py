from django.test import TestCase

from pages.models import Page


class PagesTestCases(TestCase):
    """
    Page test cases
    """
    def test_page_is_created_successfully(self):
        """
        Test page is create successfully
        """
        page = Page(name="Home", slug="home")
        page.save()

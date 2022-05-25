from django.test import TestCase

from pages.models import Page


class PagesTests(TestCase):
    def test_page_is_created_successfully(self):
        """

        :return:
        """
        page = Page(
            name='Home',
            slug='home'
        )
        page.save()

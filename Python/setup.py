try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

config = {
    'name': 'euler',
    'description': 'Solutions to project euler problems',
    'author': 'Max Del Giudice',
    'author_email': 'maxdelgiudice@gmail.com',
    'version': '0.1',
    'install_requires': ['nose'],
    'packages': ['euler', 'euler.utils', 'euler.p50'],
}

setup(**config)


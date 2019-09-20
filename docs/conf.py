# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys
sys.path.insert(0, os.path.abspath('./sphinxcontrib-cldomain/sphinxcontrib'))

# -- Project information -----------------------------------------------------

project = 'cl-tg-bot'
copyright = '2019, Valentin Boettcher'
author = 'Valentin Boettcher'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinxcontrib.cldomain',
    'sphinxcontrib.hyperspec'
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'src/**']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'alabaster'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

html_sidebars = {
    '**': [
        'about.html',
        'navigation.html',
        'relations.html',
        'searchbox.html',
        'donate.html',
    ]
}

html_css_files = [
    'style.css',
]

html_theme_options = {
}

from os.path import join, dirname, realpath, expandvars

# --- CL domain customizations:
#
# cl_systems: The systems and packages from which to extract documentation:
#
# name - The name of the system to load.
# path - The path to the system.
# packages - A list of the packages to extract symbol information from.
#
# Note: This conf.py sits in a subdirectory below ("../"), relative to where
# the "my-system.asd" system description file lives:
cl_systems = [{"name": "cl-telegram-bot",
               "path": join(dirname(realpath(__file__)), "../"),
               "packages": ["cl-telegram-bot"]}]
# cl_quicklisp: The default is $HOME/quicklisp. Shown here for completeness,
# and you can comment it out:
cl_quicklisp = expandvars('$HOME/.rosswell/lisp/quicklisp')

# Ensure that the default highlighting language is CL:
highlight_language = 'common-lisp'

# For developer debugging only (and the curious, although, it did kill the cat!)
# Currently ``True`` or ``False`` to output the JSON collected from cldomain.
cl_debug = False

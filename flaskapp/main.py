# main.py

import stripe
import os
from flask import Blueprint, render_template
from flask_login import login_required, current_user
from . import db

stripe_keys = {
    'secret_key': os.environ['STRIPE_SECRET_KEY'],
    'publishable_key': os.environ['STRIPE_PUBLISHABLE_KEY']
            }

stripe.api_key = stripe_keys['secret_key']

main = Blueprint('main', __name__)


@main.route('/')
def index():
    return render_template('index.html')


@main.route('/profile')
@login_required
def profile():
    return render_template('profile.html', name=current_user.name, paid=current_user.paid, key=stripe_keys['publishable_key'])

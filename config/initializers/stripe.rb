if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Z4I5mJmu8nrhvjTakAvGLLb1',
    :secret_key => 'sk_test_yBHP3CFwGXOjgwNd6BA6pNtO'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

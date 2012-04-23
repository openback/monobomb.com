{% get products from products.all limit:theme.featured_products order:theme.featured_order %}

{% if products != blank %}

{% for product in products %}{% if forloop.first %}<a href="{{ product.url }}" class="product"><figure><img src="{{ product.image | product_image_url size:"large" }}" alt="Image of {{ product.name | escape }}" width="300" height="300"><figcaption><span class="sku"></span> <span class="name">{{ product.name | escape }}</span> <span class="price">{{ product.default_price | money_with_sign }}{% if product.on_sale %} <span class="on-sale">On Sale!</span>{% endif %}</span></figcaption></figure><div class="arrow"></div></a>{% else %}<a href="{{ product.url }}" class="product"><figure><img src="{{ product.image | product_image_url size:"large" }}" alt="Image of {{ product.name | escape }}" width="300" height="300"><figcaption><span class="sku"></span> <span class="name">{{ product.name | escape }}</span> <span class="price">{{ product.default_price | money_with_sign }}{% if product.on_sale %} <span class="on-sale">On Sale!</span>{% endif %}</span></figcaption></figure><div class="arrow"></div></a>{% endif %}{% endfor %}
{% else %}

<p class="alert_no_products">No products found.</p>

{% endif %}

{% endget %}

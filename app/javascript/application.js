// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener("DOMContentLoaded", function () {
  const mp = new MercadoPago('TEST-d5bb9337-01fb-48dd-a62f-a350a74870ed', {
    locale: 'es-AR'
  });
  const bricksBuilder = mp.bricks();

  const renderCardPaymentBrick = async (bricksBuilder) => {
    const settings = {
      initialization: {
        amount: 100,
        payer: {
          email: "",
        },
      },
      customization: {
        visual: {
          style: {
            theme: 'default',
            customVariables: {}
          }
        },
        paymentMethods: {
          maxInstallments: 1,
        }
      },
      callbacks: {
        onReady: () => {},
        onSubmit: (cardFormData) => {
          return new Promise((resolve, reject) => {
            fetch("/process_payment", {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
              },
              body: JSON.stringify(cardFormData)
            })
            .then((response) => {
              resolve();
            })
            .catch((error) => {
              reject();
            });
          });
        },
        onError: (error) => {},
      },
    };

    window.cardPaymentBrickController = await bricksBuilder.create('cardPayment', 'cardPaymentBrick_container', settings);
  };

  renderCardPaymentBrick(bricksBuilder);
});

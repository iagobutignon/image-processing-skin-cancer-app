from flask import Flask, request
from services.image_service import ImageService

app = Flask(__name__)


@app.route("/gray_scale", methods=['POST'])
def gray_scale():
    id = request.json['id']
    imageAux = request.json['image']
    image = ImageService.apply_gray_scale(imageAux, id)
    return {
        "id": id,
        "image": image
    }, 200

@app.route("/blur", methods=['POST'])
def blur():
    id = request.json['id']
    imageAux = request.json['image']
    image = ImageService.apply_blur(imageAux, id)
    return {
        "id": id,
        "image": image
    }, 200

@app.route("/contrast", methods=['POST'])
def contrast():
    id = request.json['id']
    imageAux = request.json['image']
    image = ImageService.apply_contrast(imageAux, id)
    return {
        "id": id,
        "image": image
    }, 200

@app.route("/detail", methods=['POST'])
def detail():
    id = request.json['id']
    imageAux = request.json['image']
    image = ImageService.apply_detail(imageAux, id)
    return {
        "id": id,
        "image": image
    }, 200

@app.route("/sobel", methods=['POST'])
def sobel():
    id = request.json['id']
    imageAux = request.json['image']
    image = ImageService.apply_sobel(imageAux, id)
    return {
        "id": id,
        "image": image
    }, 200


@app.route("/contour", methods=['POST'])
def contour():
    id = request.json['id']
    imageAux = request.json['image']
    image = ImageService.apply_contour(imageAux, id)
    return {
        "id": id,
        "image": image
    }, 200

@app.route("/emboss", methods=['POST'])
def emboss():
    id = request.json['id']
    imageAux = request.json['image']
    image = ImageService.apply_emboss(imageAux, id)
    return {
        "id": id,
        "image": image
    }, 200

@app.route('/histogram', methods=['POST'])
def histogram():
    id = request.json['id']
    imageAux = request.json['image']
    histogram = ImageService.extract_color_histogram(imageAux, id)
    return {
        "id": id,
        "image": histogram
    }, 200


if __name__ == "__main__":
    app.run(host="192.168.0.104", port=8000, debug=True)
# flask run -h 192.168.0.109 -p 8000

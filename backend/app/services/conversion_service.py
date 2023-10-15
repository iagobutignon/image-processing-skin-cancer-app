from io import BytesIO
import base64


class ConversionService():
    def encodeImage(image):
        buffered = BytesIO()
        image.save(buffered, format='JPEG')
        img = base64.b64encode(buffered.getvalue())
        return img

    def decodeImage(image):
        img = BytesIO(base64.b64decode(image))
        return img

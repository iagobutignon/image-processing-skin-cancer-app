from PIL import Image, ImageOps, ImageFilter, ImageEnhance
from services.conversion_service import ConversionService


class ImageService():
    def apply_gray_scale(image, id):
        R = 0.2989
        G = 0.5870
        B = 0.1140

        _image = ImageService._open(image, id)
        image = _image.copy()
        image_width = image.width
        image_height = image.height

        for x in range(image_width):
            for y in range(image_height):
                pxl = image.getpixel((x, y))
                aux = int((pxl[0] * R) + (pxl[1] * G) + (pxl[2] * B))
                image.putpixel((x, y), (aux, aux, aux))

        image.save('../output/gray_scale/'+id+'_gray_scale.jpg')
        img = ConversionService.encodeImage(image)
        return img.decode('utf-8')
    
    def apply_blur(image, id):
        image = ImageService._open(image, id)
        image = image.filter(ImageFilter.GaussianBlur)
        image = image.filter(ImageFilter.MinFilter(15))
        image.save('../output/blur/'+id+'_blur.jpg')
        img = ConversionService.encodeImage(image)
        return img.decode('utf-8')
    
    def apply_contrast(image, id):
        image = ImageService._open(image, id)
        image = image.filter(ImageFilter.GaussianBlur)
        image = image.filter(ImageFilter.MinFilter(15))
        image = ImageEnhance.Contrast(image).enhance(11)
        image.save('../output/contrast/'+id+'_contrast.jpg')
        img = ConversionService.encodeImage(image)
        return img.decode('utf-8')

    def apply_detail(image, id):
        image = ImageService._open(image, id)
        image = image.filter(ImageFilter.DETAIL)
        image.save('../output/detail/'+id+'_detail.jpg')
        img = ConversionService.encodeImage(image)
        return img.decode('utf-8')
    
    def apply_sobel(image, id):
        image = ImageService._open(image, id)
        image = image.convert("L")
        image = image.filter(ImageFilter.GaussianBlur)
        image = image.filter(ImageFilter.MinFilter(15))
        image = ImageEnhance.Contrast(image).enhance(11)
        image = image.filter(ImageFilter.SMOOTH)
        image = image.filter(ImageFilter.EDGE_ENHANCE_MORE)
        image = image.filter(ImageFilter.EMBOSS)
        image = image.filter(ImageFilter.FIND_EDGES)
        image.save('../output/sobel/'+id+'_sobel.jpg')
        img = ConversionService.encodeImage(image)
        return img.decode('utf-8')

    def apply_contour(image, id):
        image = ImageService._open(image, id)
        image = image.filter(ImageFilter.CONTOUR)
        image.save('../output/contour/'+id+'_contour.jpg')
        img = ConversionService.encodeImage(image)
        return img.decode('utf-8')

    def apply_emboss(image, id):
        image = ImageService._open(image, id)
        image = image.filter(ImageFilter.GaussianBlur)
        image = image.filter(ImageFilter.MinFilter(15))
        image = ImageEnhance.Contrast(image).enhance(11)
        image = image.filter(ImageFilter.SMOOTH)
        image = image.filter(ImageFilter.EDGE_ENHANCE_MORE)
        image = image.filter(ImageFilter.EMBOSS)
        image.save('../output/emboss/'+id+'_emboss.jpg')
        img = ConversionService.encodeImage(image)
        return img.decode('utf-8')

    def extract_color_histogram(image, id):
        image = ImageService._open(image, id)
        image = image.convert("L")
        histogram = image.histogram()
        print(len(histogram))
        return histogram

    def _open(image, id):
        image = Image.open(ConversionService.decodeImage(image))
        image.save('../output/base/'+id+'_base.jpg')
        image = ImageOps.exif_transpose(image)
        return image

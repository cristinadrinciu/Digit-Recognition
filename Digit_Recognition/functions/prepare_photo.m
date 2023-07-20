function sir = prepare_photo (im)
  %initializare sirul final.
  sir = zeros (1, 784);
  
  % inverseaza pixelii imaginii im.
  im = 255 - im;
  
  % white = 0
  % black = 255
  % transpune imaginea, iar apoi transforma imaginea intr-un vector linie.
  % functia reshape
  im = im';
  sir = reshape(im, 1, 784);
endfunction

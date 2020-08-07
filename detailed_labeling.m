function detailed_labeling(path, input_image)
    labeled_image = My_bwlabel(input_image);
    n = max(max(labeled_image));
    A = zeros(n,2);
    for i = 1:n
       mask = (labeled_image == i); 
       surface = sum(sum(mask));
       average_spec = sum(sum(mask.*input_image))/surface;
       A(i,1) = surface;
       A(i,2) = average_spec;
    end
    xlswrite(path,A);
end
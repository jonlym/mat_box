function [x_graph_data, y_graph_data] = readDataFromImage(file_name, x_graph, y_graph)
    graph = imread(file_name);
    imshow(graph);
    
    disp('Please click the x tick marks on the graph.');
    [x_pixel, ~] = ginput(length(x_graph));
    if any(size(x_pixel) ~= size(x_graph))
        x_pixel = x_pixel';
    end
    disp('Please click the y tick marks on the graph.');
    [~, y_pixel] = ginput(length(y_graph));
    if any(size(y_pixel) ~= size(y_graph))
        y_pixel = y_pixel';
    end
    
    xEq = polyfit(x_pixel, x_graph, 1);
    yEq = polyfit(y_pixel, y_graph, 1);

    fprintf('x_graph = %f * x_pixel + %f\n', xEq(1), xEq(2));
    fprintf('y_graph = %f * y_pixel + %f\n', yEq(1), yEq(2));
    
    disp('Please click the data points you would like to convert.');
    [x_pixel_data, y_pixel_data] = ginput();
    x_graph_data = polyval(xEq, x_pixel_data);
    y_graph_data = polyval(yEq, y_pixel_data);
end
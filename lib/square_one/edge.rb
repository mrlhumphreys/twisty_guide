require 'matrix'
require 'lib/square_one/element'

module SquareOne
  class Edge < SquareOne::Element
    def base_points
      @base_points ||= [
        Matrix.column_vector([x+half_face_size-half_edge_width, y]),
        Matrix.column_vector([x+half_face_size+half_edge_width, y]),
        Matrix.column_vector([x+half_face_size, y+half_face_size])
      ] 
    end
  end
end

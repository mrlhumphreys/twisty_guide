require 'matrix'
require 'lib/square_one/element'

module SquareOne
  class Middle < SquareOne::Element
    def base_points
      @base_points ||= [
        Matrix.column_vector([x+half_face_size+half_edge_width, y]),
        Matrix.column_vector([x+face_size, y]),
        Matrix.column_vector([x+face_size, y+face_size]),
        Matrix.column_vector([x+half_face_size-half_edge_width, y+face_size])
      ] 
    end
  end
end

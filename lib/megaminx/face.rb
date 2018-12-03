require './lib/face_parser'
require './lib/megaminx/element'

module Megaminx
  class Face
    CENTER_INDEX = 0
    EDGE_INDEX = 1
    CORNER_INDEX = 2
 
    ROTATION_STEP = 2 * Math::PI / 5

    ROTATION_MATRIX = Proc.new do |theta|
      Matrix[
        [Math.cos(theta), -1*Math.sin(theta)], 
        [Math.sin(theta), Math.cos(theta)]
      ]
    end

    ROTATION_MATRICES = Array.new(5) do |i|
      ROTATION_MATRIX.call(ROTATION_STEP * i)
    end

    def initialize(x:, y: , units: , elements: , rotation_offset: 0, label: nil)
      @x, @y = x, y
      @units = units
      @elements = FaceParser.new(elements).to_a
      @rotation_offset = rotation_offset
      @label = label
    end

    attr_reader :x, :y, :units, :elements, :rotation_offset, :label

    def rotation_offset_matrix 
      @rotation_offset_matrix ||= ROTATION_MATRIX.call(rotation_offset)
    end

    def label_position
      x = rotation_point[0,0] - units*0.3
      y = rotation_point[1,0] + units*0.4
      {
        x: x.round, 
        y: y.round 
      }
    end

    def label_size
      units
    end

    def rotation_point
      @rotation_point ||= Matrix.column_vector([x+2*units, y+2*units])
    end

    def rotate(matrix, point)
      (matrix * (point - rotation_point)) + rotation_point
    end

    def top_outer_corner
      @top_outer_corner ||= rotate(rotation_offset_matrix, Matrix.column_vector([x+2*units,y]))
    end

    def outer_corners
      @outer_corners ||= ROTATION_MATRICES.map do |matrix|
        rotate(matrix, top_outer_corner)
      end
    end

    def top_outer_edge
      point_a, point_b = outer_corners.first(2)
      @top_outer_edge = (point_a + point_b) / 2 
    end

    def outer_edges
      @outer_edges ||= ROTATION_MATRICES.map do |matrix|
        rotate(matrix, top_outer_edge)
      end
    end

    def intersection(a,b,c,d)
      x1 = a[0,0]
      y1 = a[1,0] 
      x2 = b[0,0]
      y2 = b[1,0]
      x3 = c[0,0]
      y3 = c[1,0]
      x4 = d[0,0]
      y4 = d[1,0] 

      px_numerator = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
      px_denominator = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4) 

      py_numerator = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
      py_denominator = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)

      px = px_numerator / px_denominator
      py = py_numerator / py_denominator

      Matrix.column_vector([px, py])
    end

    def top_inner_corner
      intersection(outer_edges[4], outer_edges[1], outer_edges[3], outer_edges[0])
    end

    def inner_corners
      @inner_corners ||= ROTATION_MATRICES.map do |matrix|
        rotate(matrix, top_inner_corner)
      end
    end

    def element_shapes
      elements.each_with_index.map do |row, row_index|
        row.each_with_index.map do |element, element_index|
          points = case row_index
          when CENTER_INDEX
            inner_corners  
          when EDGE_INDEX
            [
              outer_edges[element_index], 
              inner_corners[(element_index+1) % 5], 
              inner_corners[element_index], 
            ]
          when CORNER_INDEX
            [
              outer_corners[element_index], 
              outer_edges[element_index], 
              inner_corners[element_index], 
              outer_edges[(element_index-1) % 5], 
            ]
          end

          if element
            Megaminx::Element.new(points: points, colour: element[:colour], opacity: element[:opacity]) 
          end
        end
      end.flatten.compact
    end

    def outer_edges_ordered_by_evens_then_odds
      evens = outer_edges.select.with_index { |_,i| i % 2 == 0 } 
      odds = outer_edges.select.with_index { |_,i| i % 2 == 1 } 
      evens + odds
    end

    def outline_string
      outer_corners.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
    end

    def inner_string
      inner_corners.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
    end

    def inline_string
      outer_edges_ordered_by_evens_then_odds.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
    end
  end
end

import Foundation

struct Point {
    let row: Int
    let column: Int
    
    func left() -> Point? {
        if column == 0 {
            return nil
        }
        else
        {
            return Point(row: row, column: column - 1)
        }
    }
    
    func up() -> Point? {
        if row == 0 {
            return nil
        }
        else
        {
            return Point(row: row - 1, column: column)
        }
    }
    
    func right(max: Int) -> Point? {
        if column == max - 1 {
            return nil
        }
        else
        {
            return Point(row: row, column: column + 1)
        }
    }
    
    func down(max: Int) -> Point? {
        if row == max - 1 {
            return nil
        }
        else
        {
            return Point(row: row + 1, column: column)
        }
    }
}

final class FillWithColor {
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        var visited = Array(repeating: Array(repeating: false, count: image[0].count), count: image.count)
        let originalColor = image[row][column]
        var newImage = image
        var queue = [Point]()
        queue.append(Point(row: row, column: column))
        newImage[row][column] = newColor
        visited[row][column] = true
        while queue.count != 0 {
            let currentPoint = queue.remove(at: 0)
            if let left = currentPoint.left(), newImage[left.row][left.column] == originalColor, !visited[left.row][left.column] {
                newImage[left.row][left.column] = newColor
                visited[left.row][left.column]  = true
                queue.append(left)
            }
            if let right = currentPoint.right(max: image[0].count), newImage[right.row][right.column] == originalColor, !visited[right.row][right.column] {
                newImage[right.row][right.column] = newColor
                visited[right.row][right.column]  = true
                queue.append(right)
            }
            if let up = currentPoint.up(), newImage[up.row][up.column] == originalColor, !visited[up.row][up.column] {
                newImage[up.row][up.column] = newColor
                visited[up.row][up.column]  = true
                queue.append(up)
            }
            if let down = currentPoint.down(max: image.count), newImage[down.row][down.column] == originalColor, !visited[down.row][down.column] {
                newImage[down.row][down.column] = newColor
                visited[down.row][down.column]  = true
                queue.append(down)
            }
        }
        
        return newImage
    }
}

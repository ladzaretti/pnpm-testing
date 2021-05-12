import * as Matrix from './matrix'

type Extends<T1, T2> = T2 extends T1 ? T2 : never

export type Point2D = Matrix.Matrix<1, 3>
export type Point3D = Matrix.Matrix<1, 4>

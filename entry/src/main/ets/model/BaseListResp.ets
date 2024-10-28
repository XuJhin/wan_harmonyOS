// "curPage": 1,
// "datas": [],
// "offset": 0,
// "over": false,
// "pageCount": 788,
// "size": 20,
// "total": 15750
export interface BaseRespEntity<T> {
  curPage: number
  datas: T[],
  offset: number
  over: boolean
  pageCount: number
  size: number
  total: number

}
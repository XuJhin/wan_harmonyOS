import { ArticleEntity } from "../../model/ArticleEntity"
import { BaseDataSource } from "../../repository/BaseDataSource"


export class ArticleDataSource extends BaseDataSource<ArticleEntity> {
  public setupData(list: ArticleEntity[]) {
    this.clearData()
    this.newDataList(list)
  }
}
import { LightningElement, track } from 'lwc';

export default class SimulacaoDeCustos extends LightningElement {

    //Aqui tem um array de objetos, para popular as linhas da tabela no front
    @track PrdtList = [
      { recId: '1', ProdName: 'Analista de QA Jr', Price: 6000, Qty: 0, Total: 0, Msg: '' },
      { recId: '2', ProdName: 'Analista de QA Pl', Price: 10500, Qty: 0, Total: 0, Msg: '' },
      { recId: '3', ProdName: 'Analista de QA Sr', Price: 15000, Qty: 0, Total: 0, Msg: '' },
      { recId: '4', ProdName: 'Analista de Suporte Jr', Price: 5500, Qty: 0, Total: 0, Msg: '' },
      { recId: '5', ProdName: 'Analista de Suporte Pl', Price: 8500, Qty: 0, Total: 0, Msg: '' },
      { recId: '6', ProdName: 'Analista de Suporte Sr', Price: 12000, Qty: 0, Total: 0, Msg: '' },
      { recId: '7', ProdName: 'Desenvolvedor Jr', Price: 8000, Qty: 0, Total: 0, Msg: '' },
      { recId: '8', ProdName: 'Desenvolvedor Pl', Price: 13000, Qty: 0, Total: 0, Msg: '' },
      { recId: '9', ProdName: 'Desenvolvedor Sr', Price: 23000, Qty: 0, Total: 0, Msg: '' },
      { recId: '10', ProdName: 'Tech Lead', Price: 27000, Qty: 0, Total: 0, Msg: '' }
    ];

    //A variável totalVal vai guardar o valor total geral
    totalVal = 0;

    //Este método é executado sempre que a quantidade de algum serviço for alterada
    handleQtyChange(event) {
      let qtd = this.PrdtList.find(
        (record) => record.recId === event.target.dataset.id).Qty = parseFloat(event.target.value);  //Aqui foi um jeito que encontrei para saber qual quantidade foi alterada
                                                                                                     //usando o método find para encontrar o objecto com o mesmo Id passado pelo evento e armazenandoo na qtd

      //Aqui eu testo se foi tentado passar um valor negativo, se o valor for negativo ele altera para 0 automaticamente, e exibe uma mensagem.
      if(qtd < 0){
        qtd = 0;
        this.PrdtList.find(
          (record) => record.recId === event.target.dataset.id).Qty = 0;
        this.PrdtList.find(
          (record) => record.recId === event.target.dataset.id).Msg = 'Não é permitido valor negativo!';
      }
      else {
        this.PrdtList.find(
          (record) => record.recId === event.target.dataset.id).Msg = '';
      }

      //Aqui eu crio uma variável total, que recebe o valor da multiplicação da qtd (criada acima) e do preço do produto
      let total = this.PrdtList.find(
          (record) => record.recId === event.target.dataset.id).Price * qtd;

      //Aqui eu atribuo ao atributo Total do objeto o valor da variável total (criada acima)
      this.PrdtList.find(
            (record) => record.recId === event.target.dataset.id).Total = total;
      
      //Por fim para ter o valor total geral funcionan corretamente eu precisei usar o recude
      //O recude recebe 2 parametros, 1 onde ele vai armanezar o total e 1 onde ele recebe o valor atual, e executa uma ação, que nesse caso é somar
      //Basicamente ele é usado para reduzir um conjunto de valores em 1 valor apenas, usando algum critério logico
      this.totalVal = this.PrdtList.reduce((p,v) => p + v.Total, 0);
    }

    //Este método zera todos os valores usados para fazer os calculos de valores
    handleLimpar(event){
      this.PrdtList.forEach(element => {
        element.Qty = 0;
        element.Total = 0;
        this.totalVal = 0;
      });
    }
  }
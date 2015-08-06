<div ng-controller="PessoaListController as ctrl">

	<jsp:include page="../core/home-description.jsp"></jsp:include>

	<a href ng-click="ctrl.atualizar()" class="pull-right">
		<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> Atualizar &nbsp;   
	</a>

	<a href="#/pessoa/{{ ctrl.module }}/form">
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		Adicionar novo {{ ctrl.moduleNameSingular }}
	</a>


	<div class="panel panel-primary">
		<div class="panel-body">
		
			<div style="width:100%; height:320px; overflow: auto;" class="table-responsive">
				<table class="table table-hover table-responsive">
					<thead>
						<tr>
							<th class="col-md-1">ID</th>
							<th class="col-md-5">Nome</th>
							<th>E-Mail</th>
							<th class="text-center">Telefones</th>
							<th class="col-md-1 text-center">
								<span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
							</th>
						</tr>
					</thead>
					<tbody>
							<tr ng-repeat="pessoa in ctrl.pessoas">
								<td>{{ pessoa.id }}</td>
								<td>{{ pessoa.nome }}</td>
								<td>{{ pessoa.email }}</td>
								<td class="text-center">
									<a href ng-click="ctrl.verTelefones( pessoa )" class="btn btn-xs btn-default" title="Ver Telefones...">
										<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
									</a>
								</td>
								<td class="text-center">
									<a href="#/pessoa/{{ ctrl.module }}/{{ pessoa.id }}" class="btn btn-xs btn-default" title="Editar registro...">
										<span class="glyphicon glyphicon-edit text-primary" aria-hidden="true"></span>
									</a>
									<a href ng-click="ctrl.remove( pessoa.id )" class="btn btn-xs btn-default" title="Deletar registro...">
										<span class="glyphicon glyphicon-remove text-danger" aria-hidden="true"></span>
									</a>
								</td>
							</tr>
					</tbody>
				</table>
			</div>
			
		</div> <!-- panel body -->
	</div> <!-- panel -->

 	<!-- Modal Telefones -->
	<div class="modal fade" id="modalTelefones" role="dialog" aria-labelledby="gridSystemModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">

	      <div class="modal-body">
	        	
		        <table class="table table-condensed">
		        	<thead>
		        		<th class="col-md-1 text-center">DDD</th>
		        		<th class="text-center">N�mero</th>
		        		<th class="col-md-2 text-center">Tipo</th>
		        		<th class="col-md-1 text-center">Principal</th>
		        		<th class="col-md-1 text-center">
		        			<span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
		        		</th>
		        	</thead>
		        	<tbody>
			      		<tr ng-repeat="telefone in ctrl.pessoa.telefones" class="text-center">
			      			<td>{{ telefone.ddd }}</td>
			      			<td>{{ telefone.numero }}</td>
			      			<td>{{ telefone.tipo }}</td>
			      			<td>
			      				<span class="glyphicon glyphicon-ok text-success" ng-show="{{ telefone.principal }}" aria-hidden="true"></span>
			      			</td>
			      			<td>
			      				<a href="">
			      					<span class="glyphicon glyphicon-trash text-danger" aria-hidden="true"></span>
			      				</a>
			      			</td>
			      		</tr>
		        	</tbody>
		        </table>
		      
		      <br/>
		      

			<div class="panel panel-default">
			  <div class="panel-heading">Cadastrar novo telefone para {{ ctrl.moduleNameSingular }}: <span class="badge">{{ ctrl.pessoa.nome }}</div>
			  <div class="panel-body">

			      <form class="form-inline" name="frmTelefone" ng-submit="ctrl.telefoneSubmit()">
			      		<div class="form-group">
					      	<input type="text" class="form-control text-center" name="ddd" ng-model="ctrl.telefone.ddd" size="5px" maxlength="2" placeholder="DDD" />
			      		</div>
				      	<div class="form-group">
					      	<input type="text" class="form-control text-center" autofocus="autofocus" name="numero" size="19px" ng-model="ctrl.telefone.numero" maxlength="10" placeholder="N�mero" />
			      		</div>
			      		<div class="form-group">
			      			<select class="form-control" name="tipo" ng-model="ctrl.telefone.tipo">
			      				<option value="" selected>--- Selecione o Tipo ---</option>
			      				<option value="RESIDENCIAL">RESIDENCIAL</option>
								<option value="CELULAR">CELULAR</option>
								<option value="COMERCIAL">COMERCIAL</option>
								<option value="RECADO">RECADO</option>
								<option value="OUTRO">OUTRO</option>
			      			</select>
			      		</div>
			      		<div class="checkbox">
						    <label>
						      <input type="checkbox" name="principal" ng-model="ctrl.telefone.principal"> Principal
						    </label>
						</div>
	
						<br/><br/>
			          <button type="submit" class="btn btn-primary">
			      			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			      			Salvar
			      	  </button>
					  <button type="button" class="btn btn-default pull-right" data-dismiss="modal">
					  	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					  	Fechar
					  </button>
		          </form>


			  </div>
			</div>		      
		      
	      </div>
	      
	    </div>
	  </div>
	</div> 	

</div> <!-- ctrl -->
class Array

  #
  # Selectionne les elements dont le champ id satisfait le critere
  # specifie par le bloc.
  #
  def selectionner_avec( id )
    DBC.check_type( id, Symbol,
                    "** L'argument a selectionner_avec doit etre un symbole" )

    nil
  end

  def method_missing( id, *args )
        if id.to_s =~/=$/              
                newId = id.to_s.chop
                definir_reader_et_writer(newId.to_sym)
                instance_eval "@#{newId} = args[0]"
        else
                raise NoMethodError
        end
  end
end

module PowerBanksHelper
    def locatable_options
      warehouses = Warehouse.all.map { |w| [w.name, w.id] }
      stations = Station.all.map { |s| [s.name, s.id] }
      warehouses + stations
    end
  end
  
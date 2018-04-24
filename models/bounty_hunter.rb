require("pg")

class Bounty

  attr_accessor :name, :species, :home_world, :last_known_location

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @species = options["species"]
    @home_world = options["home_world"]
    @last_known_location = options["last_known_location"]
  end

  #instance method
  def save()
    db = PG.connect({
      dbname: "space_cowboys",
      host: "localhost"
      })
      sql = "INSERT INTO bounties
      (name,
        species,
        home_world,
        last_known_location)
        VALUES
        ($1, $2, $3, $4) RETURNING id"
        values = [@name, @species, @home_world, @last_known_location]
        db.prepare("save", sql)
        @id = db.exec_prepared("save", values)[0]["id"]
        db.close()
      end

      def update()
        db = PG.connect({
          dbname: "space_cowboys",
          host: "localhost"
          })
          sql = "UPDATE bounties
          SET (name, species, home_world, last_known_location)
          = ($1, $2, $3, $4) WHERE id = $5"
          values = [@name, @species, @home_world, @last_known_location, @id]
          db.prepare("update", sql)
          db.exec_prepared("update", values)
          db.close()
        end

        def delete()
          db = PG.connect({
            dbname: "space_cowboys",
            host: "localhost"
            })
            sql = "DELETE FROM bounties WHERE id = $1"
            db.prepare("delete", sql)
            db.exec_prepared("delete", [@id])
            db.close
          end

        end

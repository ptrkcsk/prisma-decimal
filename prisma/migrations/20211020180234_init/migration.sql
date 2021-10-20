-- CreateTable
CREATE TABLE "item" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "location_id" INTEGER NOT NULL,

    CONSTRAINT "item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "location" (
    "id" SERIAL NOT NULL,
    "lat" DECIMAL(11,8) NOT NULL,
    "lon" DECIMAL(11,8) NOT NULL,

    CONSTRAINT "location_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "location_lat_lon_key" ON "location"("lat", "lon");

-- AddForeignKey
ALTER TABLE "item" ADD CONSTRAINT "item_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "location"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

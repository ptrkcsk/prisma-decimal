import { PrismaClient } from '@prisma/client'

const lat = 41.658
const lon = -70.2981

const prisma = new PrismaClient({log: [{level: 'query', emit: 'event'}]})

prisma.$on('query', event => {
  console.log(`prisma:query: ${event.query}`)
  console.group()
  console.log(`params: ${event.params}`)
  console.groupEnd()
})

async function main() {
  await prisma.$executeRaw`TRUNCATE TABLE item, location RESTART IDENTITY;`

  await prisma.item.create({
    data: {
      name: 'Test 1',
      location: {
        connectOrCreate: {
          create: {lat, lon},
          where: {lat_lon:{lat, lon}}
        }
      }
    }
  })

  await prisma.item.create({
    data: {
      name: 'Test 2',
      location: {
        connectOrCreate: {
          create: {lat, lon},
          where: {lat_lon:{lat, lon}}
        }
      }
    }
  })
}

main()

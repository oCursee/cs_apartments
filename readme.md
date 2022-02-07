## Needed

1. https://forum.cfx.re/t/release-small-apartment/625512/4
2. Ox_Inventory
3. Qtarget


```Important DO this below.``


## Go to ox_inventory --> data --> "stashes.lua" and add the following line. 

```{
		coords = vec3(361.79, 273.06, 91.01),
		target = {
			loc = vec3(361.79, 273.06, 91.01),
			length = 1.2,
			width = 1.6,
			heading = 0,
			minZ = 87.49,
			maxZ = 93.09,
			label = 'Open Apartment Storage'
		},
		name = 'Apartment Storage',
		label = 'Apartment Storage',
		owner = true,
		slots = 70,
		weight = 70000,
	},
```



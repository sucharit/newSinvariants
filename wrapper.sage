## Copyright (C) 2012 Robert Lipshitz and Sucharit Sarkar.
## Contact: lipshitz@math.columbia.edu, sucharit@math.columbia.edu

## This file is part of newSinvariants.

## newSinvariants is free software: you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation, either version 3 of the
## License, or (at your option) any later version.

## newSinvariants is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with KhovanovSteenrod; see COPYING.  If not, see
## <http://www.gnu.org/licenses/>.


load main.sage

load extracted.sage

N=len(all_knots)


writing=open("output.txt","w")

for i in range(0,N):
    name=all_knots[i]
    print i
    print name

    hom=eval(name+'_hom')
    rasmus=eval(name+'_rasmus')
    
    if (-2,rasmus-1) in hom.keys():
        (res,cross)=PDtoOur(eval(name+'_pd'))
        vert=PDtoCan(eval(name+'_pd'))

        K=RasmusKh(ResolvedKnot(res),vert,cross,rasmus,False)

        print K.is_more
        print '\n'

        if K.is_more:
            writing.write(name+'\n\n')
            writing.flush()

writing.close()

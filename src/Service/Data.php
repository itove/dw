<?php
/**
 * vim:ft=php et ts=4 sts=4
 * @author Al Zee <z@alz.ee>
 * @version
 * @todo
 */

namespace App\Service;

use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Conf;
use App\Entity\Node;
use App\Entity\Region;

class Data
{
    private $doctrine;
    
    public function __construct(ManagerRegistry $doctrine)
    {
        $this->doctrine = $doctrine;
    }
    
    public function get()
    {
        $conf = $this->doctrine->getRepository(Conf::class)->find(1);
        $nodeRepo = $this->doctrine->getRepository(Node::class);
        $regions = $this->doctrine->getRepository(Region::class)->findAll();
        $arr = [
            'description' => $conf->getDescription(),
            'keywords' => $conf->getKeywords(),
            'site_name' => $conf->getName(),
            'icp' => $conf->getIcp(),
            'address' => $conf->getAddress(),
            'phone' => $conf->getPhone(),
            'email' => $conf->getEmail(),
        ];
        
        foreach($regions as $r ) {
            $limit = $r->getCount();
            if ($limit > 0) {
                $order = 'DESC';
            } else {
                $order = 'ASC';
            }
            if ($limit !== 0) {
                $arr[$r->getLabel()] = $nodeRepo->findBy(['region' => $r], ['id' => $order], abs($limit));
            } else {
                $arr[$r->getLabel()] = $nodeRepo->findOneBy(['region' => $r]);
            }
        }
        
        return $arr;
    }
}


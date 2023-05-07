<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230507031323 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE node_tag (node_id INT NOT NULL, tag_id INT NOT NULL, INDEX IDX_70AC95F8460D9FD7 (node_id), INDEX IDX_70AC95F8BAD26311 (tag_id), PRIMARY KEY(node_id, tag_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE node_tag ADD CONSTRAINT FK_70AC95F8460D9FD7 FOREIGN KEY (node_id) REFERENCES node (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE node_tag ADD CONSTRAINT FK_70AC95F8BAD26311 FOREIGN KEY (tag_id) REFERENCES tag (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE node ADD region_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE node ADD CONSTRAINT FK_857FE84598260155 FOREIGN KEY (region_id) REFERENCES region (id)');
        $this->addSql('CREATE INDEX IDX_857FE84598260155 ON node (region_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE node_tag DROP FOREIGN KEY FK_70AC95F8460D9FD7');
        $this->addSql('ALTER TABLE node_tag DROP FOREIGN KEY FK_70AC95F8BAD26311');
        $this->addSql('DROP TABLE node_tag');
        $this->addSql('ALTER TABLE node DROP FOREIGN KEY FK_857FE84598260155');
        $this->addSql('DROP INDEX IDX_857FE84598260155 ON node');
        $this->addSql('ALTER TABLE node DROP region_id');
    }
}
